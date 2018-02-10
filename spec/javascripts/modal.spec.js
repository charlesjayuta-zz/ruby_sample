import { shallow } from '@vue/test-utils'
import Modal from 'components/modal'

describe('Grid', () => {
    const wrapper = shallow(Modal)

    it('renders the correct markup', () => {
        expect(wrapper.html()).toContain('<b-modal')
    })
})