# some manipulation with user data
class UserData
  @emails = [
    'lou.hand@mohr.name', 'sigmund@schamberger.org', 'clement@kreigerbeer.co',
    'marcus_strosin@nienow.org',
    'levi.kuhn@tremblay.info', 'arlo@blickgrant.name', 'jonathon@rath.co',
    'kailee.olson@quigley.org', 'alaina@renner.net', 'dylan@mclaughlin.net',
    'luna_hyatt@ritchiecronin.name', 'amie_blick@kiehn.info',
    'carolina@bechtelargleichner.name',
    'saul_heaney@heathcote.com', 'dell_tromp@kuvalisfunk.io',
    'lexie.hyatt@okuneva.com',
    'marquise@oconnerbailey.name', 'adah@hauckspencer.info',
    'gilberto@cronin.name',
    'dock.braun@bins.com'
  ]

  @ages = [
    30, 14, 30, 27, 23, 17, 25, 22, 24, 13, 27,
    15, 22, 13, 19, 20, 16, 10, 21, 25
  ]

  @names = %w(
    Michel Reagan Annabelle Chanelle Jennyfer Adonis
    Vidal Lera Aurore Garrett Vergie Lauryn Paxton
    Osborne Clinton Karson Ellie Hermann Else Otilia
  )

  def self.to_h
    value = @ages.zip(@names).flatten.compact
    value_to_arr = value.each_slice(2).to_a
    emails_to_values = @emails.zip(value_to_arr).flatten
    user_data = emails_to_values.each_slice(3).to_a
    users = user_data.map { |x| [x.first, x.last(2)] }.to_h
  end

  def self.over_19_years_old
    to_h.select { |k, v| v[0] > 19 }
  end

  def self.sorted_by_name
    to_h.sort_by {|k, v| v[1] }.to_h
  end

  def self.array_of_domains
    array = to_h.keys
    array.map { |x| x.gsub(/.*?(?>@)/im, "")}
  end
end

#puts UserData.to_h
#puts UserData.over_19_years_old
puts UserData.sorted_by_name
puts UserData.array_of_domains
