<a name="readme-top"></a>

<div align="center">
  <h1><b>🥗 Recipe App 🍲</b></h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [🌯 Recipe App ](#-recipe-app-)
- [🛠 Built With ](#-built-with-)
  - [📌 Tech Stack ](#-tech-stack-)
- [🎲 Key Features ](#-key-features-)
- [💻 Getting Started ](#-getting-started-)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors ](#-authors-)
- [🔭 Future Features ](#-future-features-)
- [🤝 Contributing ](#-contributing-)
- [⭐️ Show your support ](#️-show-your-support-)
- [🙏 Acknowledgments ](#-acknowledgments-)
- [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 🌯 Recipe App <a name="about-project"></a>

**Recipe App** keeps track of all your recipes, ingredients, and inventory. <br>
It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe. <br>
Also, the app should allow you to make them public so anyone can access them.

The data model is based on the Entity Relationship Diagram (ERD) below 👇 👇

![recipe_erd_2_members](https://github.com/rica213/recipe-app/assets/10439283/814a6c24-5a3b-4226-b298-cf347c5a9e6d)

# 🛠 Built With <a name="built-with"></a>

## 📌 Tech Stack <a name="tech-stack"></a>

| Domain | Tech Stack |
|--------|--------|
| Server | <a href="https://rubyonrails.org/">Ruby on Rails</a> |
| Database | <a href="https://www.postgresql.org/">PostgreSQL</a> |
| Testing Framework | <a href="https://github.com/rspec/rspec-rails">RSpec Rails,</a> <a href="https://rubydoc.info/github/teamcapybara/capybara">Capybara</a> |
| Authentification | <a href="https://github.com/heartcombo/devise#getting-started">Devise</a> |
| Authorization | <a href="https://github.com/CanCanCommunity/cancancan#installation">cancancan</a> | 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- Features -->

# 🎲 Key Features <a name="key-features"></a>

 - A login page.
 - A registration page.
 - A food list (with all CRUD implementation, except for 'update').
 - A recipes list (with all CRUD implementation, except for 'update').
 - A general shopping list view (all missing food for all your recipes and total price).
 - A list of all public recipes from other users with their names and total prices.
 - A navigation menu that allows users to open all of the pages.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

# 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

## Prerequisites

In order to run this project you need:

- **Ruby 3.2.2** installed

- **Rails** installed

Run this command to install **Rails**

```sh
 gem install rails
```
## Setup

Clone this repository to your desired folder:

Example commands:

```sh
  cd my-folder
  git clone git@github.com:rica213/recipe-app.git
```

To install dependencies, run:

```sh
bundle install
```

To set up the database, run:
```sh
rails db:create
```

```sh
rails db:migrate
```

## Usage

To run the project, execute the following command:

Example command:

```sh
  rails server
```

## Run tests

To run tests, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

# 👥 Authors <a name="authors"></a>

👩🏽‍🍳 **Clarielle Larissa**

- GitHub: [@rica213](https://github.com/rica213)
- Twitter: [@alc3and](https://twitter.com/alc3and)
- LinkedIn: [Clarielle Larissa](https://linkedin.com/in/larissa-clarielle)

🧑🏽‍🍳 **Shaaibu Suleiman**

- GitHub: [@shaaibu7](https://github.com/shaaibu7)
- Twitter: [@SuleimanShaaibu](https://twitter.com/SuleimanShaaibu)
- LinkedIn: [Shaaibu Suleiman](https://www.linkedin.com/in/shaaibu-suleiman-119271206/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

# 🔭 Future Features <a name="future-features"></a>

  - Add styling to all the pages
  - Implement edit ingredient
  - Implement delete ingredient
  - Implement edit recipe
  - Implement edit food
  - Deploy project
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

# 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

# ⭐️ Show your support <a name="support"></a>

Your support is crucial to the success of this project! There are ways you can contribute and show your support:

- Provide Feedback: If you've tried out the project or have any suggestions for improvement, we would love to hear from you. Your feedback is invaluable in shaping the future direction of the project.

- Kindly Give a 🌟 STAR 🌟 if you like this project!

Remember, your support matters! Whether it's spreading the word, providing feedback, reporting issues, contributing code, or making a donation, every action makes a difference. Together, we can make this project even better.

Thank you for your support and for being a part of this journey! ❤️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

# 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank: 
- Microverse
- Code Reviewers
- Peers who debated with us about the project requirements 🤩 
  - [Racheal](https://github.com/coderacheal) 👧🏾
  - [Frempong](https://github.com/frempongdev) 😎
  - [Joseph](https://github.com/Zeph180) 🤭

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

# 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
