$(document).ready(function(){
  onJobClick();
})

function onJobClick(){
  $('#save-job').on('click', function(){
    var jobId = $(this).data().jobButton
    var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();
    var company = $('[data-company="' + (jobId - 1) + '"]').text();
    var location = $('[data-location="' + (jobId - 1) + '"]').text();
    var description = $('[data-description="' + (jobId - 1) + '"]').html();
    var position = $('[data-position="' + (jobId - 1) + '"]').text();
    var datePosted = $('[data-postedon="' + (jobId - 1) + '"]').text();
    var apply = $('[data-apply="' + (jobId - 1) + '"]').html();
    debugger;
    // var salary = $().html();
    // var language = $().html();

  })
}
