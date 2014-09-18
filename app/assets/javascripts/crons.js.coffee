# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  init_result = ->
    $('#result').html('')

  create_table = ->
    '<table class="table table-striped table-bordered table-condensed">
       <tbody></tbody>
     </table>'

  create_row = (title, value) ->
    "<tr><th>#{title}</th><td>#{value}</td></tr>"

  $('#btn_check').click ->
    $.post '/',
      format_str: $('#format_str').val(),
      (data) ->
        console.log(data)
        init_result()
        $('#status').html data.status
        $('#message').html ' - ' + data.message if data.message?
        if data.status == "success"
          $('#result').append(create_table())
          $('#result > table > tbody').append(create_row(I18n.t('label.input_str'), data.input_str))
          $('#result > table > tbody').append(create_row(I18n.t('label.last'), data.last))
          $('#result > table > tbody').append(create_row(I18n.t('label.now'), data.calculated_date))
          next = for d, i in data.next
            $('#result > table > tbody').append(create_row(I18n.t('label.next_times', { times: i + 1 }), d.date))
