cask 'mazda-toolbox' do
  version '.2002137182,2019_10_11__09_44_00'
  sha256 '3f681abb7dc274d99b8ad31b2ccc06dd13cc4caef112321ea1d3f5c4f5e0821b'

  # azure.distrib.naviextras.com/content/!application was verified as official when first introduced to the cask
  url "https://azure.distrib.naviextras.com/content/!application/TOOLBOX/Agents/Mazda/OSX/#{version.after_comma}/Mazda-Toolbox.dmg"
  appcast 'https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://www.naviextras.com/to/MazdaToolboxOSX',
          configuration: version.after_comma
  name 'Mazda Toolbox'
  homepage 'https://infotainment.mazdahandsfree.com/navigation-updatemymaps'

  depends_on macos: '>= :yosemite'

  app 'Mazda Toolbox.app'

  uninstall signal: [
                      ['KILL', 'com.mazda.toolbox'],
                    ]

  zap trash: [
               '~/Library/Application Support/Mazda Toolbox',
               '~/Library/Caches/Mazda Toolbox',
               '~/Library/Caches/com.mazda.toolbox',
               '~/Library/Cookies/com.mazda.toolbox.binarycookies',
               '~/Library/Logs/Mazda Toolbox',
               '~/Library/Preferences/com.mazda.toolbox.plist',
               '~/Library/Saved Application State/com.mazda.toolbox.savedState',
             ]
end
