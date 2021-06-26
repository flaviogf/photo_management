# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:type) }

  it { is_expected.to define_enum_for(:type).with_values(%i[png jpg]) }

  it { is_expected.to validate_numericality_of(:size) }

  it { is_expected.to validate_numericality_of(:size).only_integer }

  it { is_expected.to validate_numericality_of(:size).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:opened_at) }
end
