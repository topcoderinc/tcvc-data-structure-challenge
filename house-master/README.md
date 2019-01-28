# Welcome To tips4myfirsthouse

 A basic tool for people to help buy their first home. An application for
 real estate agents to give to their potential clients to differentiate
 themselves from other agents.

 Here is a link to the live site:

 www.tips4myfirsthouse.com

## Dependencies


This project was built using Ruby, version 2.4.0, along with Rails, version 4.2.5. For Ruby installation or update, please see the following documentation: [https://github.com/postmodern/ruby-install](https://github.com/postmodern/ruby-install). For Rails installation, please follow this guide: [http://installrails.com](http://installrails.com/). For Rails update, please see: [http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html](http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html).

## Local Installation

Fork and Clone the project locally.  Here is githubs documentation:
https://help.github.com/articles/fork-a-repo/

Make sure you cd into the project folder and from your terminal run
```
rake db:migrate
rake db:seed
```
After this you should have most of the basic information.
To run the project locally from the terminal enter:
```
rails s
```
You should be able to navigate to `localhost:3000` and see the site.

On the homepage I have a few ways to navigate to the features of the page. There is also twitter feed from
all of the hottest real estate trends so people can find them right on the homepage

![alt text](https://raw.githubusercontent.com/nagano564/house/master/app/assets/images/homepage.png)

I created a checklist so people can keep track of what to do while they are looking for homes. The site is
responsive and mobile friendly so they can add items right from their phone while getting ideas of what needs to
done in order to purchase their dream home.

![alt text](https://raw.githubusercontent.com/nagano564/house/master/app/assets/images/checklist.png)
![alt text](https://raw.githubusercontent.com/nagano564/house/master/app/assets/images/mobile.png)

I thought that having the zillow api would be the most accurate way of having people be able to search for a
home from my website so I added the zillow search api.

![alt text](https://raw.githubusercontent.com/nagano564/house/master/app/assets/images/zillow.png)

Happy House Hunting!!!!
