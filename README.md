## Introduction
To do list is a very simple web application one can made. The logic behind is pretty straightforward. 

However, in this project, there's a few things I wish to practice. I have always love how those productivity apps allow users to visualise their progress in graph. So, one of my primary goal in developing this application is to implement this feature.

## Use Cases
1. Visitor can login and sign up in the home page.
2. Visitor can add tasks.
3. Visitor can mark task as done.
4. Visitor can remove tasks.
5. __Visitor can view their progress in graph.__

## Features
1. Graph _(Yes, I like graphs a lot)_
	* The graph is plotted using [Chart.js](http://www.chartjs.org).
	* With [chartjs-ror](https://github.com/airblade/chartjs-ror) gem, the chart is rendered with the helper method of `= bar_chart(@data, @options)` in Haml _(`<%= bar_chart(@data, @options) %>` in erb)_.
	* `Tasks::GraphController` is responsible for handling related request.	
	* `Tasks::GraphHelper` is responsible for handling the data required by `Chart.js`.
2. Sidebars _(Not sure if this considered as a features)_

## Limitation
* The authentication process is very basic. There is no validation whether an authentic email is used.
* The date range of graph is only limited to current and previous week, month and year. Older history are not available in the graph view.

## To Do

- [X] User is able to view their progress in graph.
- [ ] User is able to choose what type of graph to be plotted.
- [ ] Sidebars.
- [ ] Beautiful and Clean UI. _(Beauty is subjective)_
- [ ] Proper error Handling.

## Resources

* [Chart.js](http://www.chartjs.org)
* [chartjs-ror](https://github.com/airblade/chartjs-ror)
* [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
* [carrierwave-dropbox](https://github.com/robin850/carrierwave-dropbox)


