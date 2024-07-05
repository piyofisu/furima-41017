document.addEventListener('turbo:load', function(){
  // 出品・編集ページのフォームを取得
  const postForm = document.getElementById('item-image');

  // 新規投稿・編集ページのフォームがないならここで終了。
  if (!postForm) return null;
  console.log("preview.jsが読み込まれました");
});