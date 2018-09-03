module GarageHelper

  def markers_here_from(garages)
    garages.map do |garage|
      <<-JS
      var marker_#{garage.id} = new google.maps.Marker({
      map: map,
          position: {lat: #{garage.latitude}, lng: #{garage.longitude}},
          title: '#{garage.name}'
      });
      markers['#{garage.id}'] = marker_#{garage.id};
      JS
    end.join().html_safe
  end
end
