# Stolen from Pimeys on GitHub
# encoding: utf-8

# B: 96% ↑ (0:14)
# B: 20% ↓ (0:30)
# B: 100% ↔

acpi_output = %x[/usr/bin/acpi].split(' ').map{|i| i.gsub(',', '')}

status_symbols = {
  'Unknown'     => '↔',
  'Full'        => '↔',
  'Charging'    => '↑',
  'Discharging' => '↓'
}

level_colors = {
  'red'         => (0..9),
  'yellow'      => (10..19),
  'green'       => (20..100)
}

output_percentage = acpi_output[3]

battery_level = case output_percentage.delete('%').to_i
                when level_colors['red']
                  "<fc=#f2777a>#{output_percentage}</fc>"
                when level_colors['yellow']
                  "<fc=#ffcc66>#{output_percentage}</fc>"
                when level_colors['green']
                  "<fc=#99cc99>#{output_percentage}</fc>"
                else
                  "<fc=#99cc99>#{output_percentage}</fc>"
                end

symbol = status_symbols[acpi_output[2]]

time = if acpi_output[4]
         time_orig = acpi_output[4].split(':')
         "(#{time_orig[0]}:#{time_orig[1]})"
       else
         "(F)"
       end

puts "Bat: #{battery_level} #{symbol} #{time}"
