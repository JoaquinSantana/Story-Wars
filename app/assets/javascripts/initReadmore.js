$(document).on('ready page:load', function() {
    article = $('article.voteChapter-content');
    article.readmore({
        speed: 150,
        maxHeight: 102,
        moreLink: '<a href="#">' + article.data('readmore') + '</a>'
    });
});