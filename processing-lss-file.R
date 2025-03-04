# Specify the path to your LSS file
lss_file <- "/home/juko/Downloads/limesurvey_survey_882875.lss"
# Load necessary libraries
library(xml2)
library(tibble)

# Read the LSS file as an XML document
doc <- read_xml(lss_file)

# Inspect the document structure if needed
print(xml_name(doc))
print(xml_children(doc))

# Locate all <question> nodes within the <question_l10ns> table
question_nodes <- xml_find_all(doc, "//question_l10ns/rows/row/question")

# Extract the raw content (which includes the CDATA wrapper and HTML)
questions_html <- sapply(question_nodes, xml_text)

# Function to remove CDATA markers and strip out HTML tags (if any)
strip_html <- function(html_str) {
  # Remove the CDATA markers using fixed matching
  html_str <- gsub("^<![CDATA[", "", html_str, fixed = TRUE)
  html_str <- gsub("]]>", "", html_str, fixed = TRUE)
  
  # If the string does not appear to start with an HTML tag, return as is.
  if (!grepl("^\\s*<", html_str)) {
    return(html_str)
  }
  
  # Otherwise, parse as HTML and extract the plain text
  html_doc <- read_html(html_str)
  plain_text <- xml_text(html_doc)
  return(plain_text)
}
