$(document).on('ready page:load', function() {
    $('article.voteChapter-content').readmore({
        speed: 150,
        maxHeight: 102,
        moreLink: '<a href="#">Read more and vote</a>'
    });
});