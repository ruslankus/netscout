			var cpu_data = ['CPU usage', 30, 70, 90, 95, 75, 40];
			var memory_data = ['Memory usage', 95, 10, 90, 20, 35, 40];	                  
			time_x = ['x', 0, 10, 20, 30, 40, 50];
            // cpu chart
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
            // cpu memory
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
			
            //cpu temp
			var chart = c3.generate({
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
			            ['data2', 20, 40, 70, 85, 80, 60]
			        ],
			        types: {
			            data2: 'area-step'
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
	


//moreSnow();
/*
function refreshCarts()
{
    chart_cpu.load({
        columns: [
            ['CPU usage', Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1), 
			Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1), 
			Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1)]
        ]
    });


    chart_memory.load({
        columns: [
            ['Memory usage', Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			 Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1),
			  Math.floor((Math.random() * 100) + 1), Math.floor((Math.random() * 100) + 1)]
        ]
    })
    chartCicle();
}
*/


//chartCicle();


function chartCicle() {
setTimeout("refreshCarts()", 2000);
} 
/*
moreSnow();
function moreSnow() {
// content of moreSnow function
setTimeout("moreSnow()", speed);
} 
*/

