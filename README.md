## Introduction
To do list is a very simple web application one can made. The logic behind is pretty straightforward. 

However, in this project, there's a few things I wish to practice. I have always love how those productivity apps allow users to visualise their progress in graph. So, one of my primary goal in developing this application is to implement this feature.

## Features
1. Graph _(Yes, I like graphs a lot)_
	* The graph is plotted using [Chart.js](http://www.chartjs.org).
	* With [chartjs-ror](https://github.com/airblade/chartjs-ror) gem, the chart is rendered with the helper method of `bar_chart(@data, @options)`.
	* `Tasks::GraphController` is responsible for handling related request.	
	* `Tasks::GraphHelper` is responsible for handling the data required by `Chart.js`.
2. Sidebars _(Not sure if this considered as a features)_

## Limitation
* The authentication process is very basic. There is no validation whether an authentic email is used.
* The date range of graph is only limited to current and previous week, month and year. Older history are not available in the graph view.

## To Do

- [X] User is able to view their progress in graph.
- [X] User is able to choose what type of graph to be plotted.
- [X] Sidebars.
- [X] Beautiful and Clean UI. _(Beauty is subjective)_
- [ ] Proper error Handling.
- [X] Add in Pagination for viewing tasks.
- [ ] Improve UI for User Profile.

## Resources

* [Chart.js](http://www.chartjs.org)
* [chartjs-ror](https://github.com/airblade/chartjs-ror)
* [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
* [carrierwave-dropbox](https://github.com/robin850/carrierwave-dropbox)


