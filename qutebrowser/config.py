import themes

config.load_autoconfig(False)

themes.dracula(c, { 'spacing': { 'vertical': 6, 'horizontal': 8 } })

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('statusbar.show', 'always')

config.set('tabs.show', 'always')

config.set('url.default_page', 'https://app.daily.dev')

config.set(
    'url.searchengines',
    {
        'DEFAULT': 'https://www.google.com/search?q={}',
        'arch': 'https://wiki.archlinux.org/?search={}',
        'duckduckgo': 'https://duckduckgo.com/?q={}',
        'google': 'https://www.google.com/search?q={}',
        'youtube': 'https://www.youtube.com/results?search_query={}'
    }
)

config.set('url.start_pages', 'https://app.daily.dev')

config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')

config.bind('M', 'hint links spawn mpv {hint-url}')
