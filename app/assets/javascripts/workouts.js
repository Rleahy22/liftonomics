$('document').ready(function() {
  var Week = function(id) {
    this.id = id,
    this.days = 0
  }

  var createDayDivs = function(dayCount, weekId, week) {
    window.workoutWeek = new Week(weekId);
    week.append('<div id="week' + weekId + '"></div>')
    for (var i = 0; i < dayCount; i++) {
      $('#week' + weekId).append('<div class="day"><h3>Day ' + (i + 1) + '</h3><div class="lifts"></div></div>'
      );
      createDay();
    }
  }

  var createDay = function() {
      window.workoutWeek.days++;
    $.post('/workouts/1/days',
      {week: {id: window.workoutWeek.id},
       day: {dayNumber: (window.workoutWeek.days)}},
      function(data) {
        console.log(data);
      }
    );
  }

  $('.day-select').on('change', function() {
    var dayCount = $(this).val();
    var weekId = $(this).data('weekid');
    var week = $(this).parent();
    $(this).replaceWith('<h3 class="day-select">'+ dayCount + '</h3>')
    createDayDivs(dayCount, weekId, week);
  });
});