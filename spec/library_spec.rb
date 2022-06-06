require './lib/library'
require './lib/author'

RSpec.describe Library do
  before do
    @dpl = Library.new("Denver Public Library")
  end

  it 'exists' do
    expect(@dpl).to be_a Library
  end

  it 'has a name' do
    expect(@dpl.name).to eq("Denver Public Library")
  end

  it 'has books' do
    expect(@dpl.books).to eq([])
  end

  it 'has empty authors array' do
    expect(@dpl.authors).to eq([])
  end

  it 'has authors in the array' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
  end

end
