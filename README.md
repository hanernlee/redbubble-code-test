# Redbubble Coding Test

The Redbubble system has many digital images, often taken with a camera. We have exported EXIF data from a selection of these images. This data is available via an API.

### Instructions
Your task is to create a set of static HTML files to allow a user to browse the images contained in the API.

The API is available at: /api/v1/works.xml.

Create a batch processor that takes data from the API, and produce a single HTML page (based on this output template), for each camera make, camera model and also an index page.

The index page must contain:

Thumbnail images for the first 10 work;
Navigation that allows the user to browse to all camera makes.
Each camera make HTML page must contain:

Thumbnail images of the first 10 works for that camera make;
Navigation that allows the user to browse to the index page and to all camera models of that make.
Each camera model HTML page must contain:

Thumbnail images of all works for that camera make and model;
Navigation that allows the user to browse to the index page and the camera make.
The batch processor should take the API URL and the output directory as parameters.

The data returned from the API contains a small sample set of works.

## Running The Application

Clone or Download this repository.

### Prerequisities

Please note that you must have Ruby installed to run this application.

This application was developed using Ruby 2.2.2

### Installing

To install dependencies
* Navigate `cd` to the root of this directory
Run `bundle install`

### Usage

Before running the application, please make sure you have the correct permissions to write to the folder.

Run the application with the following command
`bin/batch_processor <API URL> <Output Directory>`

For example `bin/batch_processor "http://take-home-test.herokuapp.com/api/v1/works.xml" "output"`
* The API URL must contain valid XML data
* The output directory doesn't have to exist before running the application
* If the output directory already exits, it must be inside this root directory

If the application is run twice, please note that the existing directory and files with the same name will be overwritten.

## Running the tests

Run `bundle exec rspec`

## Design

Before developing the application, I drew a class diagram to figure out what Classes were needed, encouraging the Single Responsibility Principle as much as I could.

Here is a quick summary of my thought process:

#### Parsing the XML data
* I haven't had much experience with Nokogiri but found it to be the simplest way to extract XML data  
* Nokogiri also allows flexibility to read XML data from either a URL or XML file

#### Processing data into Work Data, Camera Make , Camera Model
* When looping through the works data, I found it easiest to create Work Data, Camera Make and Camera Model for each work within the loop.
* Work Data will store Camera Make and Camera Make will then store Camera Model
* To account for work data that had an image but no make or model, I decided to create an Unknown and Unknown Model tag to still allow access for those images


#### Creating HTML pages based on a template
* I found using ERB templates to be a much more easier approach as I would be able to use the given HTML template and add inline Ruby code to generate the data
* It was my first time using ERB outside of the Rails environment and thus relied on http://www.stuartellis.eu/articles/erb/

## Error Handling

The areas where I wanted to have some error handling were:

1. When no input arguments given
  - No API URL
  - No Output Directory

2. When there is an empty XML file or a different file type

3. When there is XML data with no make and no Model

## Testing

I wanted to test as much as I could but found difficulty in testing for file systems.

However, I was able to successfully test for the creation of files and directory using the FakeFS gem.

The tests does not include HTMLPage and TemplateFactory classes as the HTMLBuilder class already tests for the file creation.

## Contributors

Christopher Lee 2016
