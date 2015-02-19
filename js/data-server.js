$(document).ready(function(e) {
    
	$('#btn-refresh').click(function(e) {
        
        dc = $(this).data('dc');
        ip = $(this).data('ip');    
	   
		$('#charts-holder').html('<div class="data-room-preloader"><img src="/img/preloaders/2.gif" /></div>');
        
		$.ajaxSetup({async:false});

        $.ajax({
                type: "post",
                url: "/ajax/getcompinfo",
                dataType: "json",
                data: {
                    dc:dc,  
                    ip:ip
                },
                success: function(data) {
                    console.log(data)
                    

                    arrMem = data.memory;
                    arrCpu = data.cpu;
                    arrTemp = data.temp                    
                }
            });

        //return false;
		//var cpu_data = ['CPU usage', 30, 70, 90, 95, 75, 40];
        var cpu_data = arrCpu;
		//var memory_data = ['Memory usage', 95, 10, 90, 20, 35, 40];
        var	memory_data = arrMem;
        
        var temp_data = arrTemp                
        
        
		$('#charts-holder').html('<div class="chart cpu"><div class="chart-title">' +
                    '<h3>Processor usage: 34%</h3>' +
                    '</div><div id="chart_cpu"></div>' +
                    '</div><!--/chart cpu -->' +
            
                    '<div class="chart memory"><div class="chart-title">' +
                    '<h3>Memory usage: 51%</h3></div>' +
                    '<div id="chart_memory"></div></div><!--/ chart memory -->' +
    
                    '<div class="chart cpu"><div class="chart-title">' +
                    '<h3>Temperature: 45C</h3></div>' +
                    '<div id="chart_temp"></div></div><!--/ chart memory -->');
        	
			
		generate_graphics(memory_data, cpu_data, temp_data);
		
			
		$('.info-block').addClass('hidden');
		
		
		
    });	
	
	
});//document ready

function generate_graphics (memory_data, cpu_data, temp_data){
	
	time_x = ['x', 0, 10, 20, 30, 40, 50];
	
	var chart_cpu = c3.generate({
		size: {
        	height: 320,
        	width: 400
    	},
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
	});// cpu obj
	
	//memory obj
	var chart_memory = c3.generate({
		size: {
        	height: 320,
        	width: 400
    	},

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
	});// memory obj
	
	
	//temp obj
	var chart_tempreture = c3.generate({
		size: {
        	height: 320,
        	width: 400
    	},
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
	});//chart_tempreture

	$('.info-block').html('');
	
	
}// end generate grapigs