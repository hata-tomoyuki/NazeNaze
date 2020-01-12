$(function() {
  function buildHTML(post){
    var html = `<div class="main__background__post">
                  <div class="main__background__post__left_content">
                    <p class="title">
                      ${post.text}
                    </p>
                  </div>
                  <div class="main__background__post__right_content">
                    <p class="date">
                     ${post.date}
                    </p>
                    <div class="main__background__post__right_content__delete">
                      <a rel="nofollow" data-method="delete" href="/themes/31/posts/15"><i class="fas fa-trash"></i></a>
                    </div>
                  </div>
                </div>`
    return html;
  }
  $('#new_post').on('submit', function(e) {
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(post){
      console.log(post);
      var html = buildHTML(post);
      $('.main__posts').append(html);
      // $('.main__posts').animate({ scrollTop: $('main__posts')[0].scrollHeight});
      $('#post_text').val('');
      $('input').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})