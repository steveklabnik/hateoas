
About
=====

HATEOAS helps you build hypermedia API clients, by providing a simple
interface to navigate through pages, submitting forms, and caching local
responses.

The current version is 0.0.1.

Find out more at [the hateoas homepage][homepage].

Installing
==========

Become a HATEr by using Rubygems:

```
gem install hateoas
```

Usage
=====

Primarily, you'll use HATEOAS to help create your own gem to interact with your
API. We'll pretend that you're writing an API to your own blogging
software, since blogs are the Rails "Hello world" project.

Right now, HATEOAS assumes that you use XHTML5 to drive your API.

Configuration
-------------

The first thing you need to do is configure HATEOAS. Congratulations on
creating a hypermedia API; it means the configuration is minimal! Simply
assign your root URI like this:

```
Hateoas.base_uri = "http://api.hackety-hack.com"
```

HATEOAS has environment variables that make it easy to hit your local copy in
development mode. By default, HATEOAS assumes you're using pow, and so it will
append '.dev' onto the end of your `base_uri` when it is in development
mode. To use something else, set the `development_base_uri`:

```
HATEOAS.develoment_base_uri = "http://localhost:9292"
```

The `HATEOAS_ENV` variable will control which configuration is used. Just like
Rails, there are development, test, and production modes.

In my own APIs, I prefer to use URIs for my rel attributes. If you also do
this, there's an optional variable that makes using URIs simpler. Without it,
here's how you navigate to the 'new post' page, then the 'new comments'
page:

```
Hateoas::DSL.click_link("/rels/new-post")
Hateoas::DSL.click_link("/rels/new-comments")
```

And with it:

```
Hateoas.rel_namespace = "rels"

Hateoas::DSL.click_link("new-post")
Hateoas::DSL.click_link("new-comments")
```

Groovy?

DSL
---

HATEOAS provides a `DSL` module with all of the DSL methods you'll need. You
can use these methods in two ways: One is to reference them by using their fully
qualified names:

```
Hateoas::DSL.click_link("new-post")
```

Optionally, if you're building your own infrastructure around all of this, you
can include the module inside your own class:

```
class MyApi
  include Hateoas::DSL

  def navigate(path)
    click_link(path)
  end
end
```

The rest of this documentation will simply use `visit` rather than
`Hateoas::DSL.visit`.

Navigation
----------

If you read the previous section, you've got this one figured out: simply give
a rel to the `click_link` method:

```
click_link("new-post")
```

Getting Data Back
-----------------

You can access the data on the current page by using the `current_page`
method.

[homepage][http://steveklabnik.github.com/cereal]
