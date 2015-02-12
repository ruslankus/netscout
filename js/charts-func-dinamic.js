function renderCharts()
	{
	var cpu_data = ['CPU usage', Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1), 
			Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1), 
			Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1)];
	var memory_data = ['Memory usage', Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			 Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			  Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1)];	    
	var temp_data = ['temp', Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			 Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			  Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1)];	              
	time_x = ['x', 0, 10, 20, 30, 40, 50];
	var chart_cpu = c3.generate({
		bindto: '#chart_cpu',
		padding: {
			left:45,
			top:0,
			right:8,
			bottom:0,
		},
	    data: {
	    	x:'x',
	        columns: [
					time_x,
					cpu_data
	        ]
	    },
		axis: {
		  x: {
	        tick: {
	            format: function (d) { return d+"s"; }
	        }
		  },
		  y: {
		  	min: 10,
		  	max: 100,
	        tick: {
	            format: function (d) { return d+"%"; }
	        }
		  }
		},
		legend: {
				hide: true
		},
		color: {
		  pattern: ['#9e71db']
		}	
	});

	var chart_memory = c3.generate({
		bindto: '#chart_memory',
		padding: {
			left:45,
			top:0,
			right:8,
			bottom:0,
		},
	    data: {
	    	x:'x',
	        columns: [
					time_x,
					memory_data
	        ]
	    },
		axis: {
		  x: {
	        tick: {
	            format: function (d) { return d+"s"; }
	        }
		  },
		  y: {
		  	min: 10,
		  	max: 100,
	        tick: {
	            format: function (d) { return d+"%"; }
	        }
		  }
		},
		legend: {
				hide: true
		},
		color: {
		  pattern: ['#9e71db']
		}
	});

	var chart_temp = c3.generate({
		bindto: '#chart_temp',
		padding: {
			left:45,
			top:0,
			right:8,
			bottom:0,
		},
	    data: {
	    	x:'x',
	        columns: [
	        	time_x,
	            temp_data
	        ],
	        types: {
	            temp: 'area-step'
	        }
	    },
		axis: {
		  x: {
	        tick: {
	            format: function (d) { return d+"s"; }
	        }
		  },
		  y: {
		  	min: 10,
		  	max: 100,
	        tick: {
	            format: function (d) { return d+"C"; }
	        }
		  }
		},
		legend: {
				hide: true
		},
		color: {
		  pattern: ['#9e71db']
		}
	});

	return {chart_cpu:chart_cpu,chart_memory:chart_memory,chart_temp:chart_temp};
}


charts = renderCharts();
function refreshCarts()
{

	if (typeof charts !== 'undefined')
	{
		charts.chart_cpu.destroy();
		charts.chart_memory.destroy();
		charts.chart_temp.destroy();
		delete charts;

	}
	charts = renderCharts();

    chartCicle();
}


chartCicle();

function chartCicle() {
setTimeout("refreshCarts()", 2000);
} 
