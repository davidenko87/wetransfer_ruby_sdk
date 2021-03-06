require 'spec_helper'

describe TransferBuilder do
  it 'raises if given an item with a size of 0' do
    broken = StringIO.new('')
    expect {
      described_class.new.ensure_io_compliant!(broken)
    }.to raise_error(/The IO object given to add_file has a size of 0/)
  end

  it 'raises if IO raises an error' do
    broken = []

    expect {
      described_class.new.ensure_io_compliant!(broken)
    }.to raise_error(TransferBuilder::TransferIOError)
  end

  it 'adds a file' do
    transfer_builder = described_class.new
    transfer_builder.add_file_at(path: __FILE__)
    expect(transfer_builder.items.count).to eq(1)

    item = transfer_builder.items.first
    expect(item.name).to eq('transfer_builder_spec.rb')
    expect(item.io).to be_kind_of(File)
    expect(item.local_identifier).to be_kind_of(String)
  end
end
