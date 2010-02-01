// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $('.date_select').datepicker({  
    duration: '',  
    showTime: true,  
    constrainInput: false,  
    stepMinutes: 1,  
    stepHours: 1,  
    altTimeField: '',  
    time24h: false,
    showOn: 'button',
    buttonImage: '/images/calendar.gif',
    buttonImageOnly: true
  });

  $('.writer').keyup( function() {
    $('.writee')[$('.writer').index(this)].value = this.value;
  });
});
