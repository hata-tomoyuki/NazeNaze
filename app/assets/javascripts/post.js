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
                    <a class="main__background__post__right_content__icon" rel="nofollow" data-method="delete" href="/themes/${post.id}/posts/${post.theme_id}">
                      <i class="fas fa-trash-alt"></i>
                    </a>
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
      $('.main__background').append(html);
      $('.main__background').animate({ scrollTop: $('.main__background')[0].scrollHeight});
      $('#post_text').val('');
      $('input').prop('disabled', false);
    })
    .fail(function(){
      alert('メッセージを入力してください');
      $('input').prop('disabled', false);
    })
  })
});