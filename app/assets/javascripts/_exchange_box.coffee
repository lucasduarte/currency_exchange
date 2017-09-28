$(document).ready ->
  $('#quantity').keyup (e) ->
    search() 

  $('#swap').click ->
    v1 = $('#currency').val()
    v2 = $('#currency_destination').val();

    $('#currency').val(v2);
    $('#currency_destination').val(v1);

    search();



search = () ->
  $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;