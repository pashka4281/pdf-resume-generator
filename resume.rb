require 'rubygems'
require 'prawn'
require "prawn/measurement_extensions"

def section_title(title)
  stroke_color 'F0DBA7'
  stroke_horizontal_line 0, 540

  fill_color 'FFF4E4'
  fill_rectangle([0, cursor], 540, 14)

  bounding_box([10, cursor - 4], :width => 200, :height => 10) do
    font_size(9) do
      text "<i>#{title}</i>", inline_format: true, color: '3C3C3C'
    end
  end
  stroke_color 'F0DBA7'
  stroke_horizontal_line 0, 540
  move_down 5
  fill_color '000000'
end

def rule_divider(up_margin)
  move_down up_margin
  stroke_color 'EEEEEE'
  stroke_horizontal_line 0, 540
  move_down 15
end

def block_item_header(params)
  font_size(9){ text "<b>#{ params.fetch(:title) }</b> #{ "(<color rgb='459CE7'><link href='" + params[:link] + "'>" + params[:link] + "</link></color>)" if params[:link] }", inline_format: true, align: :left }
  move_up 10 if params[:right_top]
  font_size(7){ text params[:right_top], align: :right, color: '3C3C3C' } if params[:right_top]
  move_down 5 if params[:subtitle]
  font_size(10){ text params[:subtitle], inline_format: true, color: '999999' } if params[:subtitle]
  move_down 5
end

def progress_box(coords = [], content, percentage)
  stroke_color 'A27A1B'
  bounding_box(coords, width: 45, height: 20) do
    fill_color 'E1B345'
    fill { rectangle([0, 20], (45.0 / 100.0 * percentage.to_f).to_i, 20) }
    font_size(8) { text content, inline_format: true, color: '000000', align: :center, valign: :center }
    transparent(0.5) { stroke_bounds }
  end

  move_down 10
end

Prawn::Document.generate("output.pdf") do
  stroke_color 'F0DBA7'
  stroke_horizontal_line 0, 540, at: 730
  fill_color 'FFF4E4'
  fill { rectangle [0, 730], 540, 100 }
  bounding_box([100, 720], width: 160, height: 80) do
    font_size(25) { text "Pavlo Sirous", color: '000000' }
    move_down 5
    text "Ruby on Rails software architect", color: '000000'
    # transparent(0.5) { stroke_bounds }
  end

  bounding_box([270, 720], width: 50, height: 80) do
    fill_color '808080'
    font_size(9) do
      text "Address:", align: :right
      move_down 3
      text "Email:", align: :right
      move_down 3
      text "LinkedIn:", align: :right
      move_down 3
      text "Odesk:", align: :right
      move_down 3
      text "Blog", align: :right
      move_down 3
      text "GitHub", align: :right
    end
   # transparent(0.5) { stroke_bounds }
  end

  bounding_box([330, 720], width: 200, height: 80) do
    # fill_color '000000'
    font_size(9) do
      text "<b>Kharkiv, Ukraine, 61000</b>", inline_format: true, color: '000000'
      move_down 3
      text "<b><link href='mailto:pashka4281@gmail.com'>pashka4281@gmail.com</link></b>", inline_format: true, color: '459CE7'
      move_down 3
      text "<b><link href='http://www.linkedin.com/in/paulser'>www.linkedin.com/in/paulser</link></b>", inline_format: true, color: '459CE7'
      move_down 3
      text "<b><link href='https://www.odesk.com/users/~01e183417abff0dbed'>www.odesk.com/users/~01e183417abff0dbed</link></b>", inline_format: true, color: '459CE7'
      move_down 3
      text "<b><link href='http://pashka4281.github.io/'>http://pashka4281.github.io/</link></b>", inline_format: true, color: '459CE7'
      move_down 3
      text "<b><link href='https://github.com/pashka4281'>https://github.com/pashka4281</link></b>", inline_format: true, color: '459CE7'
    end
   # transparent(0.5) { stroke_bounds }
  end
  stroke_color 'F0DBA7'
  stroke_horizontal_line 0, 540, at: 630

  fill_color '000000'
  image './images/portret.png', width: 80, height: 80, at: [10, 720]
  move_down 15

  font_size(8) do
    text <<-EOS
      I build Web solutions that take care of business problems in E-Commerce and Healthcare niches. For the years working as a freelancer, I've developed my own working ethic. Strongly self-motivated person. 

      There are 5 years of professional Rails development in my background. I spent this time creating web services, web application prototypes, online services working for international clients that usually are startups/fast-growing companies. In the same time I am continuously developing myself as a professional in web programming industry.  

      I'm a full-stack developer (RubyOnRails/Database design/jQuery/html/css/deploying).
      Web scrapers creator (nokogiri, mechanize, watir).
      I prefer projects where I can grow as a professional. When working in a team, I can't perform well without well-established communication process (Scrum works fine for that).

      I'm looking for projects with strong believes in best practices to participate and to build good relationships. 

      What you can expect from me: 
      * Quality work (heavy testing, best practices, readable and maintainable code that "just works")
      * Short response time (I prefer daily conference calls via skype)
      * Good speaking English
      * Responsibility for tasks/project I work on.
      * Seamless integration with your current team  

      What would I expect from you:
      * Clear task definition
      * Easy communication
      * Adequate and in-time payment  

      My favorite book is "What I Wish I Knew When I Was 20" - by Tina Seelig
      Timezone: UTC+2
    EOS
  end
  move_down 10

  progress_box([0, cursor], "Ruby", 100)
  progress_box([55, cursor + 30], "Rails", 100)
  progress_box([110, cursor + 30], "OOP", 100)
  progress_box([165, cursor + 30], "Git", 95)
  progress_box([220, cursor + 30], "SCSS/CSS", 90)
  progress_box([275, cursor + 30], "JS/COFFEE", 90)
  progress_box([330, cursor + 30], "Rspec", 85)
  progress_box([385, cursor + 30], "Postgres", 70)
  progress_box([440, cursor + 30], "AngularJS", 70)
  progress_box([495, cursor + 30], "VIM", 55)



  fill_color '000000'
  
  #<=== BLOCK 'EDUCATION'
  section_title('EDUCATION')

  block_item_header(title: "Kharkiv National University 'V.N.Karazin'", subtitle: "Bachelor of Science (BS)", right_top: "September 2009 to June 2013")
  font_size(9) do
    text <<-EOS
      Extensive theoretical + practical course on classic programming languages (C, C++, Java), microcontrollers programming with Assembler.
      Networking course (TCP/IP stack, routing, http, hardware connection overview)
      Legal base + technical mechanisms (both "hardware" and programmatial tools) for making information secure.
      Theoretical (+ basic practical) course on parallel programming (MPI).
    EOS
  end
  move_down 15
  # ===> END BLOCK

  #<=== BLOCK 'SKILLS'
  section_title('SKILS / KEYWORDS')
  font_size(9) do
    text <<-EOS
      MySQL, JavaScript, Nginx, Linux, PostgreSQL, Ruby on Rails, Ruby, Git, AngularJS, jQuery, Ubuntu, AJAX, CSS, REST, RSpec, Agile, HTML 5, MongoDB, Amazon Web Services (AWS), OOP, Sphinx, Github, Amazon EC2, Test Driven Development, Memcached, Node.js, Redis, Bash, HAML
    EOS
  end
  move_down 15
  # ===> END BLOCK


  #<=== BLOCK 'LANGUAGES'
  section_title('LANGAGES')

  font_size(9) do
    text "Russian <color rgb='999999'>(Native or bilingual proficiency)</color>, Ukrainian <color rgb='999999'>(Native or bilingual proficiency)</color>, English <color rgb='999999'>(Professional working proficiency)</color>", inline_format: true
  end
 
  move_down 15
  fill_color '7ac143'
  fill { rounded_rectangle([0, cursor], 100, 95,10) }
  fill_color 'ffffff'
  font_size(9){ draw_text "Verified", at: [35, cursor - 87] }
  fill { rounded_rectangle([5, cursor - 5], 90, 70, 10) }
  image './images/duolingo-logo.png', width: 80, height: 60, at: [10, cursor - 10]

  fill_color '000000'
  bounding_box([110, cursor], width: 400, height: 80) do
    text "<u><link href='https://certs.duolingo.com/qmd94bxx'>Duolingo Proficiency Exam in English</link></u>", inline_format: true, color: '459CE7'
    font_size(11) do
      text "Score: 6.0 / 10 (Advanced)"
      text "<b>Advanced.</b> Can fulfill most communication goals, even on unfamiliar topics. Can understand the main ideas of both concrete and abstract writing, and interact with native speakers fairly painlessly.", inline_format: true
      text "Earned 12/22/2014", color: '999999'
    end
  end

  move_down 15
  # ===> END BLOCK




  start_new_page



  section_title('EXPERIENCE')

  block_item_header(title: "SymbiosisHealth", link: 'https://www.symbiosishealth.com', subtitle: "Web Developer", right_top: "July 2013 to Jun 2014")
  font_size(9) do
    excess_text = text_box "
      SymbiosisHealth is a online startup that is aim to provide cheap and quality medical services to those who are on a high-deductible healthcare plan. This goal is achieved by introducing providers directly to clients through powerful search capabilities. 

      Working for a year, I and my team-mates developed all main features so currently project has been switched to maintenance mode.

      I've developed most part of the Providers flow (from searching and signup form to providers wizard including integration with payment services, dynamic fees scheduling UI and so on).
      Also fixed a huge bunch of bugs. 
      Developed several b2b landing pages.
      Most active developer accordingly to the GitHub repository statistics.
      My passion on this project was creating beautiful UI controls with angularJS (found for myself that this lib is really powerful).
      During the work our team were using Scrum methodology in conjunction with TDD development style. And I think it brought very nice results!
    ", width: 300, height: 110, overflow: :truncate, at: [150, cursor + 10]
    image './images/symbiosishealth.jpg', fit: [140, 140]
    move_down 6
    text_box excess_text, width: 540, height: 50, overflow: :truncate, at: [0, cursor]
  end


  rule_divider 65

  block_item_header(title: "eSolia Inc", link: 'http://rick.cogley.info', subtitle: "Blog developer", right_top: "July 2013 to Jun 2014")
  font_size(9) do
    text_box "
      This project was initiated by eSolia's CEO, Rick Cogley. He was in need of re-building his personal blog (http://rick.cogley.info) from blogspot engine to Jekyll-based Octopress - static site generator.
      The project was successfully finished, thanks to Rick and to his outstanding co-operation skills.

      \"Pavlo did an exemplary job not only on those things, but really went the extra mile to adapt and apply a responsive HTML5 and CSS3 theme based on the famous and somewhat ubiquitous Twitter Bootstrap, to the site. Thank you Pavlo; I really appreciate your quality work, help and patience.\" - Rick Cogley
      (form http://rick.cogley.info/articles/2013/02/12/site-re-launch-in-octopress/)
    ", width: 400, height: 150, overflow: :truncate, at: [145, cursor + 10]
    image './images/esolia.png', fit: [140, 140]
  end
  rule_divider 25

  block_item_header(title: "Bidsketch", link: 'http://www.bidsketch.com', subtitle: "Rails developer", right_top: "July 2013 to Jun 2014")
  font_size(9) do
    text_box "
      Bug fixing, new features development.
      Developed several CRM & Invoicing (Harvest, Freshbooks, Basecamp, Salesforce) integrations for the service.
    ", width: 400, height: 140, overflow: :truncate, at: [145, cursor + 10]
    image './images/bidsketch.png', fit: [140, 140]
  end
  rule_divider 15



  block_item_header(title: "SweetSpeeches, HeroesMedia LLC", link: 'http://www.sweetspeeches.com', subtitle: "Rails developer", right_top: "November 2011 to February 2012")
  font_size(9) do
    text_box "
      Developed PimpinProfiles.com (https://www.pimpinprofiles.com/),
      web scrapers for SweetSpeeches.com, migrating SweetSpeeches and KickinQuotes
      (http://kickinquotes.com/) to Amazon's AWS. Many UI tasks done.
    ", width: 400, height: 140, overflow: :truncate, at: [145, cursor + 10]
    image './images/ss.png', fit: [140, 140]
  end
  rule_divider 15
  
  start_new_page

  block_item_header(title: "Balslev Media", subtitle: "Ruby web scraper developer", right_top: "April, 2013 to May 4, 2013")
  font_size(9) do
    text_box "
      Ruby scraper project. Scraping several cars selling web sites. Saving all info to mysql db, keeping all relations between vehicle, seller, model, manufacturer, equipment, color etc.
      Each site has it's profile in yml which contains description of all required fields, selectors, regexps, custom rewrite values etc.
      Multithread downloading page fetching. Images downloading. Similar car advertisement detection on different sites and many more
    ", width: 400, height: 140, overflow: :truncate, at: [145, cursor + 10]
    image './images/cars_scrapers.png', fit: [140, 140]
  end
  rule_divider 15

  block_item_header(title: "Silver Spring, MD", subtitle: "Ruby on Rails Developer", right_top: "Dec 07, 2011 to Jul 26, 2012")
  font_size(9) do
    text "Developed a prototype of a SAAS feedbacking application ", width: 400, height: 140#, at: [0, cursor + 10]
  end
  move_down 10

  text "See other projects I worked for on my <color rgb='459CE7'><link href='https://www.odesk.com/users/~01e183417abff0dbed'>odesk profile page</link></color>", inline_format: true, align: :center
  move_down 25


  section_title('PUBLIC ACTIVITY')
  font_size(8){ text 'Those are my personal projects that are available publically online or as source codes' }
  move_down 15

  block_item_header(title: "SurveysKitchen", subtitle: "online surveying software", right_top: "May, 2012 to Jun, 2013")
  font_size(9) do
    text_box "
      SurveysKitchen is full-stack online surveying tool. This is my own project and is being developed mostly for fun.
      It's based on Rails 3.2 + Mysql. Two languages localized (ru + en), but still there are some places where translation is missing.
      Heavily used jQuery + jQueryUI (for survey builder). Several custom  jquery plugins developed (whole app js is written in coffeescript).
      Deployed with capistrano + Git to Rackspace's VPS based on Ubuntu.
    ", width: 400, height: 140, overflow: :truncate, at: [145, cursor + 10]
    image './images/sk.png', fit: [140, 140]
  end
  rule_divider 15
  
 
  block_item_header(title: "CommonTime", subtitle: "a tool aimed to simplify finding common working hours for different timezones", right_top: "Dec 2015")
  font_size(9) do
    text_box "
      Single page application built with RaphaelJS that visualizes time overlap in different timezones.
      <color rgb='459CE7'><link href='commontime.info'>commontime.info</link></color>
      <color rgb='459CE7'><link href='https://github.com/pashka4281/common_time'>https://github.com/pashka4281/common_time</link></color>
    ", width: 400, height: 140, overflow: :truncate, at: [145, cursor + 10], inline_format: true
    image './images/common_time.png', fit: [140, 140]
  end
  rule_divider 15
  
  start_new_page

  section_title('RECOMMENDATIONS')
  block_item_header(title: "David Portnoy", subtitle: "CTO @ Symbiosis Health", right_top: "June 16, 2014")
  font_size(9) do
    excess_text = text_box "
      Pavlo has been an ambitious contributor to the creation of our new product and has put in many hours toiling at tough
      technical challenges. As a result, he's both made great contributions to building the product and has himself grown
      professionally. On many occasions, when Pavlo encountered previously unfamiliar technologies, such as Angular.js
      and APIs for payment processors, he eagerly took on the challenge and quickly became proficient.
      Many hard core developers I know are reluctant to touch the front end.
      But not Pavlo. He fearlessly dove into our challenges with a fully responsive UI/UX.
      There were times when our project lacked a standalone front end developer and Pavlo bailed us out.
      He's certainly earned the right to be labeled a strong full-stack developer. I hope to continue working with Pavlo in the future.
    ", width: 500, height: 40, overflow: :truncate, at: [40, cursor + 10]
    image './images/david.jpg', fit: [30, 30]
    move_down 6
    text_box excess_text, width: 540, height: 100, overflow: :truncate, at: [0, cursor]
  end

  move_down 60

  block_item_header(title: "Seth Siegler", subtitle: "Robot Workshop", right_top: "May, 2014")
  font_size(9) do
    text_box "Excellent rails dev with great communication and creativity. Highly recommended!", width: 500, height: 40, overflow: :truncate, at: [40, cursor]
    image './images/seth.jpg', fit: [30, 30]
  end

  move_down 10
  
  block_item_header(title: "Ruben Gamez", subtitle: "Founder, Bidsketch", right_top: "May 4, 2013")
  font_size(9) do
    text_box "Pavlo is an excellent Rails developer who did a lot to help improve the quality of the code while working at Bidsketch.", width: 500, height: 40, overflow: :truncate, at: [40, cursor]
    image './images/ruben.jpg', fit: [30, 30]
  end

  move_down 10

  block_item_header(title: "Rick Cogley", subtitle: "CEO eSolia Inc", right_top: "April 21, 2013")
  font_size(9) do
    excess_text = text_box "
      When relaunching my profile site, I hired Pavlo Sirous to coach me in learning git and the other technologies I need to know, and, to do the heavy ruby programming that I have no time or need to learn. He did an exemplary job not only on the requested programming activities, but going the extra mile to get a responsive HTML5 and CSS3 theme based on Twitter Bootstrap, up and running on this site. I really appreciate his quality work, help and moreover, patience.
    ", width: 500, height: 40, overflow: :truncate, at: [40, cursor + 10]
    image './images/rick.jpg', fit: [30, 30]
    move_down 6
    text_box excess_text, width: 540, height: 100, overflow: :truncate, at: [0, cursor]
  end

  move_down 20
  
  block_item_header(title: "Kareem Grant", subtitle: "Silver Spring Labs", right_top: "July, 2012")
  font_size(9) do
    text_box "Pavlo once again did a great job. I've worked with him for a while now and he is a excellent problem solver and is extremely reliable. Pavlo is an awesome developer and I look forward to working with him again.", width: 500, height: 40, overflow: :truncate, at: [40, cursor]
    image './images/kareem.jpg', fit: [30, 30]
  end

  move_down 10

  block_item_header(title: "Jereme Axelrod", subtitle: "Satellite Films", right_top: "Nov 2011")
  font_size(9) do
    text_box "Pavlo has been phenomenal. He is a very talented developer with a great work ethic. I look forward to continuing to work with him long into the future...", width: 500, height: 40, overflow: :truncate, at: [40, cursor]
    image './images/jereme.jpg', fit: [30, 30]
  end

  move_down 10

  # text "See other recommendations on my <color rgb='459CE7'><link href='https://www.odesk.com/users/~01e183417abff0dbed'>odesk profile page</link></color>", inline_format: true, align: :center

  # stroke_axis
end
