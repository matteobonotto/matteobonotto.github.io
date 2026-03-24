---
layout: default
title: Blogs
permalink: /blogs/
---

<section class="section">
  <div class="section-title">Blogs</div>
  <div class="blog-list">
    {% for post in site.posts %}
      <article class="blog-card">
        <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
        <div class="note">{{ post.date | date: "%b %-d, %Y" }}</div>
        <p>{{ post.excerpt | strip_html | truncate: 180 }}</p>
      </article>
    {% endfor %}
  </div>
</section>
