::  link: social bookmarking
::
::    link operates on the core structure of "pages", which are URLs saved at a
::    specific time with a specific title.
::    submissions, then, are pages received from a specific ship.
::
|%
::  primitives
::
+$  url   @t
+$  site  @t  ::  domain, host, etc.
::  +page: a saved URL with timestamp and custom title
::
+$  page
  $:  title=@t
      =url
      =time
  ==
::  +submission: a page saved by a ship
::
+$  submission
  $:  =ship
      page
  ==
::  +note: a comment on some url
+$  note
  $:  =time
      udon=@t
  ==
::  +comment: a comment by a ship on some url
::
+$  comment
  $:  =ship
      note
  ==
::  lists, reverse chronological / newest first
::
+$  pages        (list page)
+$  submissions  (list submission)
+$  notes        (list note)
+$  comments     (list comment)
::
::  +action: local actions
::
+$  action
  $%  ::    user actions
      ::
      ::  %save: save page to path on our ship
      ::
      [%save =path title=@t =url]
      ::  %note: save a note for a url
      ::
      [%note =path =url udon=@t]
      ::    hook actions
      ::
      ::  %hear: hear about page at path on other ship
      ::
      [%hear =path submission]
      ::  %read: hear about note on url from ship
      ::
      [%read =path =url comment]
  ==
::  +update: local updates
::
::NOTE  we include paths/urls to support the "subscribed to all" case
::
+$  update
  $%  [%local-pages =path =pages]
      [%submissions =path =submissions]
      [%annotations =path =url =notes]
      [%discussions =path =url =comments]
  ==
--
