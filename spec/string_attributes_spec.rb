require 'spec_helper'

describe StringAttributes do
  it 'has a version number' do
    expect(StringAttributes::VERSION).not_to be nil
  end

  context ".attr_string" do
    subject { User.attr_string attribute }

    context "when invalid attribute given" do
      let(:attribute) { [] }

      it { expect{ subject }.to raise_error StringAttributes::InvalidArgument }
    end

    context "when empty attribute given" do
      let(:attribute) { "" }

      it { expect{ subject }.to raise_error StringAttributes::UnkownAttribute }
    end

    context "when unknown column given" do
      let(:attribute) { "hoge" }

      it { expect{ subject }.to raise_error StringAttributes::UnkownAttribute }
    end
  end

  context "stlip" do
    subject { User.create(name: "hoge  ") }

    before { User.reset_callbacks(:validation) }

    context "when strip: true" do
      before { User.attr_string :name, strip: true }

      it { expect(subject.name).to eq "hoge" }
    end

    context "when strip: false" do
      before { User.attr_string :name, strip: false }

      it { expect(subject.name).to eq "hoge  " }
    end
  end
end
