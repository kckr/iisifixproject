module Config
  AppName                   = 'iisifix'
  SliderMin                 = 0
  SliderMax                 = 100 # in KM
  SliderStepSize            = 1 # KM
  DefaultMinRadius          = 0
  DefaultMaxRadius          = 999999999999
  SliderDefaultValue        = "[#{DefaultMinRadius},#{DefaultMaxRadius}]"
  DefaultLat                = 60.4518 #latlong of Turku
  DefaultLong               = 22.2666
  DateFormatNumeric         = 'dd/mm/yyyy'
  RubyDateFormatNumeric     = '%b %d, %Y'
  ValidImageExtensions      = %w(jpg jpeg png)
  ValidReportFileExtensions = %w(jpg jpeg png pdf)
  DefaultLogoFileName       = 'garage_dummy_logo.png'
  DefaultAvatarFileName     = 'dummy.jpg'
  DefaultCoverFileName      = 'img_bg_2.jpg'
  EmailSender               = 'noreply@iisifix.fi'
  SupportEmail              = 'support@iisifix.fi'
  SupportPhone              = '053 157 33 14'
  FullAddress               = 'Turku, Finland'
  SmsFrom                   = 'Iisifix'
  TotalStarCount            = 5
  StartingCarMakeYear       = 1950
  WeekDays                  = Date::ABBR_DAYNAMES.map(&:downcase) - ['sun', 'sat']
  BlogUrl                   = 'https://blog.iisifix.fi/'
  TwitterUrl                = 'https://twitter.com/iisifix'
  FacebookUrl               = 'https://www.facebook.com/iisifix'
  LinkedinUrl               = 'https://www.linkedin.com/in/iisifix'
  PinterestUrl              = 'https://www.pinterest.com/iisifix/'
  YoutubeURL                = 'https://www.youtube.com/channel/UC5YVgXIM8IMW8C04-4CsyRw'
  DummyRegistrationNumber   = 'ZRF-882'
end
