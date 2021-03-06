# encoding: utf-8

module Capistrano
  module Extensions
    module Server
      class Nginx < WebServer

        AVAILABLE_MODES = [:passenger, :reverse_proxy, :php_fpm]
        NGINX_TEMPLATE_PATH = ROOT_PATH + '/capistrano-exts/templates/web_servers/nginx.conf.erb'

        def initialize(mode, template_path = NGINX_TEMPLATE_PATH)
          raise ArgumentError, "The requested mode is not supported" unless AVAILABLE_MODES.include?(mode)
          raise ArgumentError, "The template file is not found or not readable" unless File.exists?(template_path)
          @mode = mode.to_sym
          @template = template_path
        end
      end
    end
  end
end