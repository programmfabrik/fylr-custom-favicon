# only set favicon for fylr, because there is already favicon-functionality in easydb5
if ez5.version("6")
  if ez5.session.config.base.plugin?['custom-favicon']
    if ez5.session.config.base.plugin['custom-favicon']?.config?.custom_favicon?.image_as_base64
      base64CustomFavicon = ez5.session.config.base.plugin['custom-favicon'].config.custom_favicon.image_as_base64
      if base64CustomFavicon != ''
        console.log("%c Welcome favicon.", "padding: 14px 0px 10px 45px; background-image: url('" + base64CustomFavicon + "'); background-repeat: no-repeat; background-position: left center; background-size: 30px auto");
        # remove existing favicon
        oldFaviconElement = document.querySelector("link[rel*='icon']")
        oldFaviconElement.remove()
        # set custom favicon
        newFaviconElement = document.createElement('link');
        newFaviconElement.type = 'image/x-icon';
        newFaviconElement.rel = 'shortcut icon';
        newFaviconElement.href = base64CustomFavicon;
        document.getElementsByTagName('head')[0].appendChild(newFaviconElement);
