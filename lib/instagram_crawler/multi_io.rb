module InstagramCrawler
  class MultiIO
    def initialize(*targets)
      @targets = targets
      @shell_colors = {
        light_red:     '\\e\\[0;91;49m',
        light_green:   '\\e\\[0;92;49m',
        light_yellow:  '\\e\\[0;93;49m',
        light_blue:    '\\e\\[0;94;49m',
        light_magenta: '\\e\\[0;95;49m',
        light_cyan:    '\\e\\[0;96;49m',
        out_put:       '\\e\\[0m'
      }
    end

    def write(args)
      @targets.each do |target|
        pretty_file_text(args) if target.is_a? File
        target.write(args)
      end
    end

    def close
      @targets.each(&:close)
    end

    private

    def pretty_file_text(args)
      @shell_colors.values.each do |color|
        args.gsub!(/#{color}/, '')
      end
      args
    end
  end
end
