$(document).ready(function(event){
  onJobRemove();
})

function onJobRemove(){
    $('button#remove-job').on('click', function(){
        var jobId = $(this).data().jobButton;
        var title = $('[data-title="' + (jobId - 1) + '"]').text().trim();
        var Id = $(this).attr("data-index");

        $.ajax({
          method: "DELETE",
          url: '/jobs/' + Id,
          dataType: 'json',
          data: {
            id:Id,
            title:title
          },
          success: function(response){
            debugger;
            $('#remove-job').removeClass("btn-primary");
            $('#remove-job').addClass("btn-success");
            $('#remove-job').html("Job removed from list");
          }
        })

  })
}
