json.text        @post.text
json.date        @post.created_at.to_s(:datetime)
json.id          @post.id
json.theme_id    @theme.id