Description
===========

This cookbook provides an easy way to install the Server Density client.
This relies on the automatic copy template feature being enabled.
* http://support.serverdensity.com/knowledgebase/articles/70726-auto-copy-templates

More information?

Requirements
============

## Cookbooks:

This cookbook has dependencies on the following cookbooks:

## Platforms:

* Ubuntu
* Debian
* RHEL
* CentOS
* Fedora

Attributes
==========

* `node['serverdensity']['repository_key']` - The ServerDensity repository key, defaults to "boxedice-public.key"
* `node['serverdensity']['agent_key']` - Your ServerDensity agent key
* `node['serverdensity']['sd_url']` - Your ServerDensity subdomain

Usage
=====

1)
include `recipe[serverdensity]` in a run list to implicly run `recipe[serverdensity::install]` and `recipe[serverdensity::server-monitor]`

2)
	change the `node['serverdensity']['agent_key']` attribute to your
Server Density agent key
	--- OR ---
	override the attribute on a higher level (http://wiki.opscode.com/display/chef/Attributes#Attributes-AttributesPrecedence)

References
==========

* [Server Density home page] (http://www.serverdensity.com/)
* ["newrelic" cookbook by escapestudios on github] (https://github.com/escapestudios/chef-newrelic)

Changelog
=========

### 0.1.0
    * Use a template to configure the server-monitor instead of the non-idempotent execute (Chris Griego)

License and Authors
===================

Author: Avrohom Katz<iambpentameter@gmail.com>
Copyright: 2012

Unless otherwise noted, all files are released under the MIT license,
possible exceptions will contain licensing information in them.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
