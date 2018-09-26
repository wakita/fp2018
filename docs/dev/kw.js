function sidenotes($body) {
  $('dl dt:contains("Note")').parent().replaceWith(function () {
    note = $(this).find('dd').html();
    $note = $('<aside class="notes"/>');
    $note.append(note);
    return $note;
  });
}

function convert() {
  console.log('converting')
  $body = $(document.body);
  sidenotes($body);
}

window.convert = convert;
