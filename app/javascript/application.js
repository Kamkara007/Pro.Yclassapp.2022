// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"


// Feed course show


document.addEventListener('turbo:load', function() {
  const viewMoreLinks = document.querySelectorAll('.feed_course_summary_content');

  viewMoreLinks.forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault();

      const summaryDiv = this.parentElement;
      const fullContentDiv = summaryDiv.nextElementSibling;

      summaryDiv.classList.add('hidden');
      fullContentDiv.classList.remove('hidden');
    });
  });
});
