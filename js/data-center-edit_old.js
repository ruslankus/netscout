/*
 *	Date created: 2015 - 02 - 05
 *
 *
 */
function report_new_values(title, ip){
	/*
	 *	This method was made to extract new values from script below;
	 *
	 *	Once "Save" button is pressed. this function receives values of changed fields ()
	 *
	 *
	 */
	//alert("Title: " + title + " IP: " + ip)
}
/*
	open edit context
*/
function edit_box( outside_container ) {
	
	var  description_con = outside_container.find(".data-room-desc");
	var  edit_con = outside_container.find(".data-room-edit");
	
	var current_title = description_con.find("h3").html();
	var current_ip = description_con.find("p").html().substring(4);
		
	description_con.hide();
	edit_con.find(".edit-title").attr("value", current_title);
	edit_con.find(".edit-ip").attr("value", current_ip);
	edit_con.show();
}
/*
	Confirm changes
*/
function save_edits(container) {
	var description_container = container.find(".data-room-desc");
	var edit_container = container.find(".data-room-edit");
	/*
	 *
	*	This is new value of new title
	*
	*/
	var edited_title = edit_container.find(".edit-title").val();
	/*
	 *
	 *	This is new value of new ip address
	 *
	 */
	var edited_ip = "IP: " + edit_container.find(".edit-ip").val();
	/*
	*/
	report_new_values(edited_title, edited_ip);// new title & ip
	/*
	*/
	description_container.find("h3").html(edited_title);
	description_container.find("p").html(edited_ip);	
	description_container.show();
	edit_container.hide();
}
/*
	Bind events
*/
$( document ).ready(function() {

	$("#data-room-boxes-wrapper .data-room-edit").hide();
	
	// auto text selection in text boxes
	$("#data-room-boxes-wrapper .data-room-edit input").bind("focus", function(){
		this.select();
	});
	
	// enter key listener
	$("#data-room-boxes-wrapper .data-room-edit input").keypress( function(event){
		if ( event.which == 13 ) {
			save_edits( $( this ).parent().parent() );
		}
	} );
  
	// Edit button
	$("#data-room-boxes-wrapper .data-room-desc a").bind("click", function() {
		edit_box( $( this ).parent().parent() );
	});
	
	// Save Button
	$("#data-room-boxes-wrapper .data-room-edit a").bind("click", function foo() {
		save_edits( $( this ).parent().parent() );
	});
});