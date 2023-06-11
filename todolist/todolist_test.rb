require "simplecov"
SimpleCov.start

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "todolist"
class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos[1..], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todos[0...-1], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todos.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_raise_error_when_adding_non_todo_object
    assert_raises(TypeError) { @list.add("foo") }
  end

  def test_shovel_method
    todo4 = Todo.new("Feed dog")
    @todos << todo4
    @list << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_shovel_add_alias
    todo4 = Todo.new("Feed dog")
    @todos << todo4
    @list.add(todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) }
    @todos.size.times { |i| assert_equal(@todos[i], @list.item_at(i)) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@list.size) }
    @list.mark_done_at(0)
    assert_equal([true, false, false], @todos.map(&:done?))
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(@list.size) }
    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(0)
    assert_equal([false, true, true], @todos.map(&:done?))
  end

  def test_done!
    assert_equal(false, @todos.any?(&:done?))
    @list.done!
    assert_equal(true, @todos.all?(&:done?))
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ----Today's Todos----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
    ----Today's Todos----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @todo2.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
    ----Today's Todos----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    i = 0
    @list.each do |todo|
      assert_equal(@todos[i], todo)
      i += 1
    end
  end

  def test_each_returns_original_object
    assert_same(@list.each { |todo| }, @list)
  end

  def test_select
    new_list = @list.select { |todo| !todo.done? }

    assert_equal(new_list.title, @list.title)
    assert_equal(@todos, new_list.to_a)
    assert_instance_of(TodoList, new_list)
    refute_same(new_list, @list)
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title("Clean room"))
    assert_nil(@list.find_by_title("Feed dog"))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @todo1.done!
    assert_equal([@todo1], @list.all_done.to_a)
    @list.done!
    assert_equal(@todos, @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@todos, @list.all_not_done.to_a)
    @todo1.done!
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
    @list.done!
    assert_equal([], @list.all_not_done.to_a)
  end

  def test_mark_done
    marked_done = @list.mark_done("Clean room")
    assert_equal(@list, marked_done)
    assert_equal([@todo2], @list.all_done.to_a)
  end

  def test_mark_all_done
    assert_equal([false, false, false], @todos.map(&:done?))
    marked_all_done = @list.mark_all_done
    assert_equal(@list, marked_all_done)
    assert_equal([true, true, true], @todos.map(&:done?))
  end

  def test_mark_all_undone
    @todos.each(&:done!)
    assert_equal([true, true, true], @todos.map(&:done?))
    marked_all_undone = @list.mark_all_undone
    assert_equal(@list, marked_all_undone)
    assert_equal([false, false, false], @todos.map(&:done?))
  end
end
