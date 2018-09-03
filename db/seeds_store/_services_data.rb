Approved    = 'approved'
AdminUserID = 1

ServicesPayload = [
# This description will be visible when user hovers
    {
        name:        'Body',
        description: '',
        services:    [
                         { name: 'Kolhu / Dent Repair', description: '' },
                         { name: 'Tuulilasi ja lasit / Windshield, mirrors and glasses', description: '' },
                         { name: 'Kori- ja vauriokorjaus / Collision Damage Repair', description: '' },
                         { name: 'Maalaustyöt / Painting work', description: '' },
                         { name: 'Tuulilasinpyyhkijä / Wiper Blades', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },

                     ]
    },
    {
        name:        'Electronics, Audio-Video and Air Conditioning',
        description: '',
        services:    [
                         { name: 'Valot / Lights', description: '' },
                         { name: 'Akku / Battery', description: '' },
                         { name: 'Ilmastointi / Air Conditioning repair', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },
                     ]
    },
    {
        name:        'Interior',
        description: '',
        services:    [
                         { name: 'Autonpenkkihuolto / Seat Repair', description: '' },
                         { name: 'Autonpenkkivaihto / Seat Change', description: '' },
                         { name: 'Tuoksu / Fragrances', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },
                         { name: 'Kojelautahuolto / Dashboard Repair', description: '' },
                     ]
    },
    {
        name:        'Powertrain, chassis and Suspension',
        description: '',
        services:    [
                         { name: 'Vaihteisto / Gearing', description: '' },
                         { name: 'Clutch / Kytkin', description: '' },
                         { name: 'Laakerit ja akselisto / Bearings and axle', description: '' },
                         { name: 'Iskunvaimentimien vaihto / Shock absorber change', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },

                     ]
    },
    {
        name:        'Engine and Exhaust',
        description: '',
        services:    [
                         { name: 'Pakoputkisto / Exhaust', description: '' },
                         { name: 'Öljynvaihto / Oil change', description: '' },
                         { name: 'Moottori / Engine repair.', description: '' },
                         { name: 'Suodattimien / Filter Changes', description: '' },
                         { name: 'Jakohihna / Timing belt change', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },
                     ]
    },
    {
        name:        'Tyres/Wheel and Braking',
        description: '',
        services:    [
                         { name: 'Jarrupalavaihto / Brake Pads change', description: '' },
                         { name: 'levyjarruvaihto / Brake disc change', description: '' },
                         { name: 'Renkaatvaihto / Tyre change', description: '' },
                         { name: 'Puhjennut rengas korja / Flat tires fix', description: '' },
                         { name: 'Nelipyöräsuuntaus / Wheel Alignment', description: '' },
                         { name: 'Reunus / Rims', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },

                     ]
    },
    {
        name:        'Miscellaneous',
        description: '',
        services:    [
                         { name: 'Määräaikaishuolto / Scheduled maintenance.', description: '' },
                         { name: 'Katsastus / Inspection Service', description: '' },
                         { name: 'Puhdistus / Washing', description: '' },
                         { name: 'Vetokoukku / Coupling', description: '' },
                         { name: 'Vikakoodien lulu / Read fault codes', description: '' },
                         { name: 'Ruostekorjaus / Rust repair', description: '' },
			 { name: 'Ruostesuojaus / Rust proof', description: '' },
                         { name: 'Optimointi ja lastutus / Optimization and lastutus', description: '' },
                         { name: 'Vianhaku / Troubleshooting', description: '' },
                         { name: 'Lisävarusteet / Accessories', description: '' },			 
                     ]
    },
]


def load_services_data
  IisifixLogger.log 'Seeding Services !!!'

  ServicesPayload.map { |x| x.sort.to_h }.each do |category|
    category_object = Category.create(category.without(:services))

    category[:services].each do |service_hash|
      Service.create(service_hash.merge({ status: Approved, category: category_object }))
    end
  end
  IisifixLogger.log 'Services Seeded !!!'
end
