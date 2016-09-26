require_relative 'Spec_helper'
require_relative '../lib/door'

describe Door do

let(:oak) { Door.new }

  it 'check initial status of door' do
    expect( oak.open ).must_equal( false )
    expect( oak.unlocked ).must_equal( false )
    expect( oak.inscription ).must_equal( nil )
  end

  it 'check unlock_door method' do
    oak.unlock_door
    expect( oak.unlocked ).must_equal( true )
  end

  it 'check lock_door method' do
    oak.unlock_door
    oak.lock_door
    expect( oak.unlocked ).must_equal( false )
  end

  it 'check open_door method' do
    oak.unlock_door
    oak.open_door
    expect( oak.open ).must_equal( true )
  end

  it 'check close_door method' do
    oak.unlock_door
    oak.open_door
    oak.close_door
    expect( oak.open ).must_equal( false )
  end

  it 'check write_inscription method' do
    oak.write_inscription("Howdy there!")
    expect( oak.inscription ).must_equal( "Howdy there!" )
  end

  it 'check read_inscription method when empty' do
    expect( oak.read_inscription ).must_equal( "" )
  end

  it 'check read_inscription method' do
    oak.write_inscription("Yum!")
    expect( oak.read_inscription ).must_equal( "Yum!" )
  end

  it 'check door cannot be written on twice' do
    oak.write_inscription("Golly gumdrops!")
    expect( proc { oak.write_inscription("And how!") } ).must_raise StandardError
  end

  it 'check open_door method when door is locked' do
    expect( proc { oak.open_door } ).must_raise StandardError
  end

  it 'check open_door method when door is already open' do
    oak.unlock_door
    oak.open_door
    expect( proc { oak.open_door } ).must_raise StandardError
  end

  it 'check close_door method when door is already closed' do
    expect( proc { oak.close_door } ).must_raise StandardError
  end

  it 'check unlock_door method when door is already unlocked' do
    oak.unlock_door
    expect( proc { oak.unlock_door } ).must_raise StandardError
  end

  it 'check lock_door method when door is already locked' do
    expect( proc { oak.lock_door } ).must_raise StandardError
  end

  it 'check lock_door method when door is open' do
    oak.unlock_door
    oak.open_door
    expect( proc { oak.lock_door } ).must_raise  StandardError
  end

end
