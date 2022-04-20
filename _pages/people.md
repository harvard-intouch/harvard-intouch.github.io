---
layout: archive
title: Peers
permalink: /peers/
---

InTouch peers are purposfully spread throughout the departments and buildings of SEAS, and encourage you to start up a casual conversation. 
At InTouch, we have two types of peers: peer mentors and peer staffers.

<strong>Peer mentors</strong> are trained in informal mentoring and conflict management and are knowledgeable about resources within and outside of Harvard. 

<strong>Peer staffers</strong> are in charge of community building and organizing. 
For one-on-one chats, please reach out to the peer mentors at any time (by email or at the coffee chats) to say hello and introduce yourself (you never need a reason). 


{% for s in site.data.people %}
  <h2>{{ s.section }}</h2>

  <div>{{ s.description }}</div>

  <div class='people'>
    {% for p in s.members %}
      <div class='person' tabindex='0' {% if p.blurb %} data-tippy-content='{{ p.blurb }}' {% endif %}>
        <div class='person__image'>
          {% if p.hover %}
            <img class='person__image__hover' src='{{ site.url }}{{ p.hover }}'>
          {% endif %}
          <img class='person__image__headshot' src='{{ site.url }}{{ p.image }}'>
        </div>

        <div class='person__name'>
          {% if p.site %}
            <a href='{{ p.site }}' target='_blank'>{{ p.name }}</a>
          {% else %}
            {{ p.name }}
          {% endif %}
        </div>
        <div class='person__title'>{{ p.title }}</div>
        <div class='person__title'>{{ p.email }}</div>
      </div>
    {% endfor %}
  </div>
{% endfor %}
