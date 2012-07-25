----

# Architecture #

----

# Aims #
* Primary mission is long term preservation of data.
* Emphasis on preservation and archival.
* *"Code dies, data lives on".*

----

# Principles #
* Simplicity. Battle tested technologies.
* Independence and self-sufficiency.
* Low maintenance.
* Low cost.

----

# Design #
* Flat file storage.
* Self contained - Metadata stored along with data.
* Reliable formats - Easy to access *forever*.
* Redundancy
    * Paired storage.
    * Mirrored at the Bibliotheca Alexandrina <http://archive.bibalex.org/>
* Unix permissions

----

# Hardware #
* The [petabox](http://archive.org/web/petabox.php) - Designed originally to hold 1 petabyte of data.
* Custom built by the Archive.
* Low power : 6KW per rack, 
* High density : 650+ TB per rack
* No air conditioning
* Fits in a shipping container. 
* Currently 4 data centres - 1300 nodes, 11000 spinning disks
* 2.4 PB for the wayback machine. 
* 1.7 PB for Books/video/audio collections.
* 5.8 PB Total used storage.

---- 

# Petabox 1 #

.fx: notitle

<img src="images/petabox-1.jpg" style="height: 100%;"/>

<div class="banner">
    <h3>The first gen petabox</h3>
</div>

----

# Petabox 2 #

.fx: notitle

<img src="images/petabox-2.jpg" style="height: 100%;"/>

<div class="banner">
    <h3>The current racks</h3>
</div>

----

# Petabox 3 #

.fx: notitle

<img src="images/petabox-3.jpg" style="width: 100%;"/>

<div class="banner">
    <h3>The racks in the great room</h3><br/>
        <a href="http://www.flickr.com/photos/mirka23/6300272115/">http://www.flickr.com/photos/mirka23/6300272115/</a>
    
</div>

----

# Shipping container #

.fx: notitle

<img src="images/container.jpg" style="height: 100%;"/>

<div class="banner">
    <h3>How big is the internet?</h3><br/>
        <a href="http://www.computerwoche.de/bild-zoom/1891307/1/489893/EL_12381492082557490680957/">http://www.computerwoche.de/bild-zoom/1891307/1/489893/EL_12381492082557490680957/</a>
    
</div>
----

# Implementation #
* Storage layer stores `items`
    * Files + derivatives + metadata
    * <http://archive.org/details/EmacsMovies>
* `items` are grouped into `collections`
* Individual files are  exposed via. http
  <http://ia700800.us.archive.org/1/items/EmacsMovies/04-episode-region.ogv>
* Permissions are UNIX file permissions.
* Extra metadata are in `_files.xml` and `_meta.xml`.
* Different applications like archive.org, wayback machine access this data.

----

# Locator service #
* UDP packet sent out when an item is requested on archive.org.
* Server that holds the data responds.
* HTTP redirect to that server.
* Allows any number of storage nodes without much infrastructure change.

----
# Deriver #
* Uploaded items are rsynced to a `worker`.
* Deriver taks run on them that create new files out of the originals. 
     * e.g. `ogg`, `mp3` out of `FLAC` files. 
* New files created, metadata updated and item rsynced back to primary.
* Originals unmodified. Derivatives often more useful.

-----
# Catalogue #
* Offline task queue.
* Heart of the archives data processing operations.
* Time consuming modifications to data are done via. catalogue tasks.
* Old fashioned message queue. Has tasks from over half a decade ago.

----

# Software stack #
* PHP, Nginx, Solr, MySQL, Redis and a pinch of Python and Java for the apps.
* Xen for virtualisation. Might move to KVM.
* Nagios, graphite, MRTG, cacti


