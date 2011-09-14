require 'capistrano/recipes/deploy/strategy/copy'

module Capistrano
  module Deploy
    module Strategy

      # This strategy behaves exactly as the regular :copy strategy, but
      # it it uses the current working directory as source for deployment.
      # So you need to make sure that all your gems are already bundled correctly.
      #
      # Not every server has access to rubygems or other repository sources,
      # so this is a try to make life easier for those who want to deploy a complete
      # package without having to run extra tasks on the remote machines.
      class CopyWorkingDir < Copy

        # @overload
        def deploy!
          FileUtils.mkdir_p(destination)
          
          logger.trace "copying working directory"
          FileUtils.cp_r( File.join(working_dir, '.'), destination )
          
          File.open( File.join(destination, "REVISION"), "w" ) { |f| f.puts(revision) }
          
          logger.trace "compressing #{destination} to #{filename}"
          Dir.chdir(copy_dir) { system(compress(File.basename(destination), File.basename(filename)).join(" ")) }
          
          distribute!
        ensure
          FileUtils.rm filename rescue nil
          FileUtils.rm_rf destination rescue nil
        end

        private
        
        def working_dir
          @working_dir ||= Dir.pwd
        end
        
      end
      
    end
  end
end
