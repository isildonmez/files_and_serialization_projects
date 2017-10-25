# from [Jumpstartlab](http://tutorials.jumpstartlab.com/projects/eventmanager.html)

## Iteration 0: Loading a File

```
lines = File.readlines "event_attendees.csv"
lines.each do |line|
  puts line
end
```
We read in the entire contents of the file as an array of lines.

If we were using `read`:

```
contents = File.read "event_attendees.csv"
puts contents
```

It gives this in terminal:
```
 ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode
1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010
2,11/12/08 13:23,SArah,Hankins,pinalevitsky@jumpstartlab.com,414-520-5000,2022 15th Street NW,Washington,DC,20009
...
```
And `p` method as below:

```
contents = File.read "event_attendees.csv"
p contents
```
Gives this:

```
" ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010\n2,..."
```

> The CSV parser that we have started to create does not take into account a number of other features supported by the CSV file format. Two important ones:
	- CSV files often contain comments which are lines that start with a pound (#) character
	- Columns are unable to support a value which contain a comma (,) character.

> *Look for a Solution before Building a Solution*

## Iteration 1: Parsing with CSV

- `:headers => true` treats the first row as a header instead of a data row.
- `:header_converters => :symbolize` parameter then converts each cell in the header row into Ruby symbol.

- We may have a problem: Some zip codes are missing or represented with less than a five-digit number.

## Iteration 3: Using Sunlight

http://congress.api.sunlightfoundation.com/legislators/locate?zip=90201&apikey=e179a6973728c4dd3fb1204283aaccb5

- `http://` : Use the HTTP protocol
- `congress.api.sunlightfoundation.com` : The server address on the internet
- `legislators.` : The object name
- `locate.` : The method called on that object
- `?` : Parameters to the method
	- `&` : The parameter separator
	- `zip=90201` : The zipcode we want to lookup
	- `apikey=e179a6973728c4dd3fb1204283aaccb5` : A registered API Key to authenticate our requests

## Iteration 4: Form Letters

- If we want to include a customized letter:
	1. we can define the template as a large string like `form_letter = %{ String Contents: the template}`. However, it makes the template and the application code much more difficult to understand.
	2. we can load the template using the same File tools like `template_letter = File.read "form_letter.html"`

- Possible problems:
	- Using FIRST_NAME and LEGISLATORS to find and replace might cause us problems if later somehow this text appears in any of our template
	- We cannot represent multiple items very easily if they are surrounded by HTML. We may need another template

- Ruby defines a template language named ERB. Defining an ERB template is extremely similar to our existing template. The difference is that we use an escape sequence tags which allow us to insert any variables, methods or ruby code we want to execute.

- File#open allows us to open a file for reading and writing. The first parameter is the name of the file. The second parameter is a flag that states how we want to open the file. The ‘w’ states we want to open the file for writing. If the file already exists it will be destroyed.

- The file object responds to the message puts. The file#puts is similar to the Kernel#puts that we have been using up to this point.



