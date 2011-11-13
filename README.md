Why am I forking this repo?
===========================

* Because I think there's mileage in exploring ideas. I'm interested in the direction
the web is taking and the future of APIs and human and machine interaction.
* Because I want to braindump some of these ideas.
* Because I was going to grab the hateoas name for a rubygem but didn't get round to doing it.

HATEOAS, JSON and forms
-----------------------
I like JSON, it's readable and clear. It lends itself well to friendly formatted output
it's beautiful because it sits in a comfortable place for humans and machines.
It doesn't work well for HATEOAS. HATEOAS requires links for conveying information
about where you can move to next and forms.
Well you can't really have JSON forms. Not without some predetermined way of expressing
them. And that presumably counts as out-of-band communication according to Roy Fielding.

I'm not entirely sold on Roy Fielding's ideas. I don't feel that anyone has truly made
them accessible to people like me and reading his blog posts doesn't help a great deal.
That doesn't mean I think it's wrong. It's just that without explicit examples of exactly
what a 100% REST compliant system is, it's difficult to decipher Roy's prose.

Trying to understand HATEOAS
----------------------------
I'd like to gain a full understanding of what something that is not just RESTful, RESTish
or RESTesque, but actually REST. Roy Fielding does the community a bit of a dis-service
by not providing positive examples of REST systems, only examples that fail to meet his
expectations. To paraphrase:

  "If you don't have full HATEOAS compliance then you don't get REST and you
  shouldn't call it REST."

OK.

Good. I'd like to create an API that is fully REST compliant. Where do I start?

I need to understand what HATEOAS is and how I can use it.

So it's Hypermedia as the Engine of Application State.

    A REST client needs no prior knowledge about how to interact with any particular
    application or server beyond a generic understanding of hypermedia.

A generic understanding of hypermedia is a little vague.

from http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven

`  A REST API should be entered with no prior knowledge beyond the initial URI
  (bookmark) and set of standardized media types that are appropriate for the
  intended audience (i.e., expected to be understood by any client that might
  use the API). From that point on, all application state transitions must be
  driven by client selection of server-provided choices that are present in the
  received representations or implied by the user’s manipulation of those representations.
  The transitions may be determined (or limited by) the client’s knowledge of media types
  and resource communication mechanisms, both of which may be improved on-the-fly
  (e.g., code-on-demand). [Failure here implies that out-of-band information is
  driving interaction instead of hypertext.]`

^
This is a part that I am conceptually struggling with.
It seems to me that there would always be coupling between a server and a client.
By trying to remove the constraint of using out-of-band information you reduce
the amount of pre-requisites but you lose something at the same time.

Communication is about expressing ideas and it would be interesting to create a
means of communication between any two systems that requires NO PRIOR KNOWLEDGE
of what that system is and/or does. Communication also depends on a common shared
vocabulary.
If I were to consume a twitter API then I would have prior knowledge of why
I wanted to consume it. I have a huge amount of out-of-band information about
why I should use it. I also might reasonably assume that I can POST tweets.
But programatically navigating this API without knowledge of anything about it?
Perhaps I'm misunderstanding but the idea of writing client code that is so flexible that
the services it connects to could completely change boggles my mind.
If I picture this scenario of ultimate future flexibility of decades long systems
that can be so flexible because they are fully REST and HATEOAS compliant and can
adapt to all sorts of changes because the client assumes nothing in advance then
I can only picture at the other end some kind of human interaction.

Pseudo-interaction of a REST client:

    * Visit api.twitter.com
    * See list of links in headers for possible next actions
    * Check for tweet rel < - how is this determined ? (no prior knowledge so how would I even know I might want to tweet?)
    * It appears twitter no longer has a tweet action
    * ...
    * Perform alternative action (Who or what decided this)

So maybe we can write clients that explore APIs and report back to more intelligent
agents about what is currently possible. Who are these agents? Intelligent software
agents? Humans? Is this out-of-band communication yet?

HATEOAS seems akin to inventing a human communication protocol that requires only an introduction
of two individuals on earth. Maybe this is a strawman but it sounds a little bit
like two people dropping the prerequisite for speaking the same language.
But perhaps this relates to the concepts of 'standards'


    A REST API should never have “typed” resources that are significant to the client.
    Specification authors may use resource types for describing server implementation
    behind the interface, but those types must be irrelevant and invisible to the client.
    The only types that are significant to a client are the current representation’s media
    type and standardized relation names.

'Standardized relation names' sounds to me like out of band communication.
It may sound like I'm naively comparing each point to human language and communication
but I think there are parallels.

It seems like it is confidently suggesting a group can come up with a set
of standards that can summarize and categorize all future expected communications.

It sounds worryingly like a top-down approach to thinking about how communications occur.
It reminds me of attempts to make languages like Esperanto.

An idealist would hope all humans can work towards creating a common language
and that if we can create a common enough framework that can be expanded upon
as necessary then we can allow communication from anyone to anyone else on earth.

But these approaches have so far failed. They mainly ignore the advantages of
specialisation, the benefits of exclusivity within a small group and the efficiency of
communication when new thoughts and ideas that might be relevant only to the local
area can be expressed. Languages merge into one another and dialects merge into
one another. Each language has a wealth of predetermined pre-encoded information
that is specific to the culture of the speakers of that language. There are
optimisations for expressing more common things more easily and I don't doubt that
certain languages lead and guide the speakers to communicate in ways or about topics
that lend themselves to easier communication in their tongue.

The gist of what I'm saying probably sounds thoroughly disconnected from what
REST is or aspires to be, but I'd like to express the parallels.
I don't think standardised out-of-band communication could work.
I think out-of-band communication and state are necessary to have expressive
and meaningfully useful communication.


**Out-of-band and state have parallels with pre-learned human language, human memory and interactions.**


I think that for machines to have meaningful relationships with each other they
may need to have a wealth of pre-determined concepts to build upon and expand
upon. I also think that at present the quickest way to express this information
in a way that enables humans and machines to interact well together is for
humans to have discussions, ideas and inspiration and to communicate how these
ideas might be shared between machines by agreeing upon simple meaningful APIs.

**I may well be missing the point, but I think coupling in communication is
possibly a necessity for meaningful communication.**
Client and server like speaker and listener are inherently bound together
and without shared prior knowledge machines can no more have meaningful discourse
than a native Mandarin speaker who speaks no other language can have a deep and
meaningful discussion with a native Spanish speaker who speaks no other language.
And any simple prescriptive predetermined protocol that the two might agree upon
is still bound to failure.

RDF
---
I need to understand RDF as it might give more insight into how XHTML APIs
could utilise more human input and actually meet the HATEOAS constraint.

RDF primer http://www.w3.org/TR/xhtml-rdfa-primer/

Summary
=======

This README has turned more into a blog post and brain dump.
It's not particularly well formed, but I'm interested in exploring my ideas
further and seeing where I end up. I'd like to find that by the end of this
exploration I understand HATEAOS and REST fully and I'd be happy to have my
doubts quashed by a crystallising epiphany about what HATEOAS truly means.

I've benefitted greatly from utilising principles of 'REST-ish' design (sorry
Roy) and so I'm not about to cast Roy Fielding and his thesis off as emperor's
clothes troll-tastic material just yet. But I am prepared to mention my doubts.

The ultimate troll would be if the complete conclusion of a 100% REST compliant
system is that of a user interacting with a web browser and reading the information
presented to them by first visiting the 'homepage' of the site.


API Exploration
===============

Without fully understanding the benefits of a HATEOAS compliant system I'd like to consider what
I might expect from using a client API:

```ruby

  twitter = Hateoas.site "api.twitter.com"
  twitter.actions
  # => [authorize: {method: :get}]
  twitter.authorize "mark@example.com", "password"
  twitter.actions
  # => [read_messages: {method: :get}, tweet: {method: :post}]
```

Now the main gist of my point comes down to the prior knowledge of the system

Looking at the example again:

```ruby
  twitter = Hateoas.site "api.twitter.com" #agreed prior knowledge of URL
  twitter.actions    #generic - no prior knowledge of twitter API. (actions method could be a generic method defined on the API but it is not preagreed information between client and server)
  # => [authorize: {method: :get}]
  twitter.authorize "mark@example.com", "password"   #choosing to call this is prior shared knowledge
```

Now HATEOAS will protect us from URL changes which is a Good Thing. Less to document and more flexibility on the server end.
But it wouldn't protect us from changes in the rel attributes. 
It's just about moving the contract between client and server to a different place. It's probably a good thing because we probably do change URLs a lot, or would if we could do it without breaking clients.

I think all that HATEOAS does is shift the point at which APIs break and changes the boundary point of the client server contract.
Yes you can tweak your server URLs by adding an extra layer of defence.
But you can't have clients that don't know about the actions they might expect to take when interacting with a service and the data they might be expected to fill in.

Clients that can react to for example, form field changes intelligently would be most likely humans.
Probably not simple Ruby scripts anyway.

So what's the upshot of this?
-----------------------------

HATEOAS seems like it will give you a slightly more friendly contract between clients and servers.
When writing our API documentation (because I can't see a way around the pre-determined information)
we can write thinner more human readable documents.
We can say things like:
  These are the services currently available:
  * authorize
  * read_messages
  * tweet

To see what fields you need to fill in you can visit the relevant URLs from the API root.

And yes you could make this straightforward XHTML and then a person can even go and browse in a web browser.
And then your API interaction could becomes the same as a human, filling in forms and clicking links (Capybara interaction).
I think that's probably writing more code than you need to, but it does give us an interesting way of exploring an API.
e.g. as a developer I'd rather write

```ruby
twitter.sign_in user: "mark@example.com", "password"
twitter.tweet "HATEOAS could make my life easier"
#than
visit "/sign_in"
fill_in "user", with: "password"
fill_in "password", with: "password"
click_button "Sign in"
fill_in "tweet", with: "HATEOAS could make my life easier"
click_button "Tweet"
```

Discoverable APIs could lead to some interesting ways that we'll be able to make our code and APIs more maintainable and easier to developer in the future. I like the idea of an API that's also browsable. 
And I think as API documentation it's a killer idea. 
In this way we reduce prior information, but it won't get us around the fact that if you change your fields or validations or the order in which it's possible to progress through a service/application, you will break your clients.

Your clients are still tied to the specific version of the API they were written against but they'll be a lot easier to update if you have a web browsable version of your API and discoverable URLs.