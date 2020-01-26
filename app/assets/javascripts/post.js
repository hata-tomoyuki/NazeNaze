$(function() {
  function buildHTML(post){
    var html = `<div class="main__background__post", id="main__background__post${post.id}">
                  <div class="main__background__post__left_content">
                    <p class="title">
                      ${post.text}
                    </p>
                  </div>
                  <div class="main__background__post__right_content", id="main__background__post__right_content${post.id}">
                    <p class="date">
                     ${post.date}
                    </p>
                    <a class="main__background__post__right_content__icon" data-remote="true" rel="nofollow" href="/themes/${post.id}/importants">
                      <i class="far fa-star"></i>
                    </a>
                    <a class="main__background__post__right_content__icon" rel="nofollow" data-method="delete" href="/themes/${post.theme_id}/posts/${post.id}">
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
      $(document).on("click", ".fas.fa-trash", function() {
        if(confirm('本当に削除しますか？')) {
          return true;
        } else {
          return false;
        }
      })
    })
    .fail(function(){
      alert('メッセージを入力してください');
      $('input').prop('disabled', false);
    })
  })
});