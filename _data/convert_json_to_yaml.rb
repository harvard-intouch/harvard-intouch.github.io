require 'json'
require 'yaml'

puts JSON.parse(File.read("#{__dir__}/finale_papers_parsed.json")).to_yaml

__END__

This converts JSON from Finale's webpage to YAML that Github pages can read. To get the JSON, I went to https://finale.seas.harvard.edu/publications, scrolled down until all were visible, copied the HTML from the body element (using the inspector, not using save page as), and then added the following code to convert the HTML to JSON (copy-pasting the resulting console.log output):

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

<script>
if (typeof(String.prototype.trim) === "undefined") {
  String.prototype.trim = function() {
    return String(this).replace(/^\s+|\s+$/g, '');
  };
}

 $(document).ready(function() {
   const papers = [];
   const years = $('.biblio-category-section');
   for (let section of years) {
     const entries = $(section).find('.biblio-entry');
     const year = $(section).find('.biblio-separator-bar').text().trim();
     if (parseInt(year) == 2013) {
       break;
     }
     for (let entry of entries) {
       const authors = $(entry).find('.biblio-authors').text();
       const title = $(entry).find('.biblio-title').text();
       const pdf = $(entry).find('.file a').attr('href');
       const rest = $(entry).text().replace(authors, '').replace(title, '').trim();
       let venue = rest.replace(/^(?:in|[\.\s,])*/, '');
       if (venue.indexOf('arXiv') >= 0) {
         venue = venue.split('.').slice(0,2).join(".").trim();
       } else {
        venue = venue.split('.')[0].trim();
       }
       const paper = {
         title, authors, venue, year, links: [{ text: "pdf", url: pdf }]
       };
       //console.log(paper);
       papers.push(paper);
     }
   }
   console.log(JSON.stringify(papers, null, 2));
 });
</script>
