$('document').ready(function() {

  var newLiftElement = '<div class="day-lift"><form accept-charset="UTF-8" action="/lifts" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#10003;"></div><input autocomplete="off" class="lift-search" id="search" name="search" type="text"></form></div>';

  var searchResultsElement = '<ul class="results"><li class="result" id="result1"></li><li class="result" id="result2"></li><li class="result" id="result3"></li><li class="result" id="result4"></li><li class="result" id="result5"></li></div>';

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

  var autocompleteSearch = function(query, liftDiv) {
    $.get('/lifts',
      {search: query},
      function(data) {
        console.log(data);
        for (var i = 0; i < 5; i++) {
          if (data[i] === undefined) {
            $('#result' + (parseInt(i) + 1)).text('');
          } else {
            $('#result' + (parseInt(i) + 1)).text(data[i].name);
          }
        }
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

  $('.add-lift').on('click', function(e) {
    console.log("YO");
    e.preventDefault();
    $(this).parent().append(newLiftElement);
    $(this).parent().append($(this));
  });

  $('.lifts').on('focus', '.lift-search', function() {
    $(this).parent().append(searchResultsElement)
  });

  $('.lifts').on('keyup', '.lift-search', function() {
    var query = $(this).val();
    var liftDiv = $(this).parent();
    autocompleteSearch(query, liftDiv);
  });

  $('.lifts').on('click', '.result', function() {
    var newLift = $(this).text();
    var liftForm = $(this).parent().parent();
    var liftDiv = liftForm.parent();
    liftForm.remove()

    liftDiv.append('<h3>' + newLift + '</h3>');

  });
});