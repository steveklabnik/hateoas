module Hateoas
  module MediaType
    def self.included(includer)
      includer.extend(ClassMethods)
    end

    module ClassMethods
      def media_type(type)
      end

      def serialization(type)
      end

      def element(*elements)
      end

      def attribute(*attributes)
      end

      def relation(*relations)
      end
    end

    def initialize(uri)
    end

    def relation_exists?(rel)
    end

    def transition(rel)
    end
  end
end

class Maze
  include Hateoas::MediaType

  media_type "application/vnd.amundsen.maze+xml"

  serialization :xml

  element :maze,
          :cell,
          :code,
          :error,
          :collection,
          :item,
          :link,
          :message,
          :title,
          :debug

  attribute :href,
            :rel,
            :side,
            :total,
            :version

  relation :collection,
           :current,
           :east,
           :exit,
           :maze,
           :north,
           :south,
           :start,
           :west

  def actions
    [:north,
     :east,
     :south,
     :west,
     :start,
     :exit].select{|rel| relation_exists?(rel) }
  end
end

maze = Maze.new("http://amundsen.com/examples/mazes/2d/five-by-five/")

puts "Let's navigate a maze!"

action = ""

until action == "exit"
  puts "You can do these things:"
  puts maze.actions.join(", ")
  puts "What would you like to do?"
  action = gets.chomp
  maze.transition(action)
end

puts "Done!"
